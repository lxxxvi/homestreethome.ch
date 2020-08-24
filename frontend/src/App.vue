<template>
  <div id="app">
    <Index v-if="currentRelease === null"
           :releases="allReleases"
           @show-release-id-event="showRelease" />
    <Release v-if="currentRelease != null"
             :release="currentRelease"
             @close-release-event="closeRelease" />
  </div>
</template>

<script>
import Index from './components/Index.vue'
import Release from './components/Release.vue'

export default {
  name: 'App',
  data: () => {
    return {
      currentRelease: null,
      allReleases: []
    }
  },
  components: {
    Release, Index
  },
  methods: {
    showRelease: function(id) {
      this.currentRelease = this.findRelease(id);
    },
    closeRelease: function() {
      this.currentRelease = null;
    },
    findRelease: function(id) {
      return this.allReleases.find(release => release.id === id);
    }
  },
  mounted: function() {
    fetch('releases.json')
      .then(response => response.json())
      .then(data => { this.allReleases = data })
  }
}
</script>
