<template>
  <div id="app">
    <div class="background"></div>
    <div>
      <Logo />
      <Index v-if="currentRelease === null"
             :releases="allReleases"
             :y-position="yPosition"
             @show-release-id-event="showRelease" />
      <Release v-if="currentRelease != null"
               :release="currentRelease"
               @close-release-event="closeRelease" />
    </div>
  </div>
</template>

<script>
import Logo from './components/Logo.vue'
import Index from './components/Index.vue'
import Release from './components/Release.vue'

export default {
  name: 'App',
  data: () => {
    return {
      currentRelease: null,
      allReleases: [],
      yPosition: 0
    }
  },
  components: {
    Logo, Index, Release
  },
  methods: {
    showRelease: async function(id) {
      this.rememberScrollPosition();
      this.findRelease(id).then((release) => {
        this.currentRelease = release;
        window.scrollTo(0, 0);
      });
    },
    closeRelease: function() {
      this.currentRelease = null;
    },
    findRelease: function(id) {
      return new Promise((resolve) => {
        resolve(this.allReleases.find(release => release.id === id));
      });
    },
    rememberScrollPosition: function() {
      this.yPosition = window.scrollY;
    }
  },
  mounted: function() {
    fetch('releases.json')
      .then(response => response.json())
      .then(data => { this.allReleases = data })
  }
}
</script>

<style scoped>
.background {
  @apply fixed bg-gradient-to-br from-teal-100 to-indigo-200 inset-0;
  z-index: -1;
}
</style>
