<template>
  <div id="app">
    <Index v-if="currentReleaseId === null" @show-release-id-event="showRelease" />
    <Release v-if="currentReleaseId != null" :release-id="currentReleaseId" @close-release-event="closeRelease" />
  </div>
</template>

<script>
import Index from './components/Index.vue'
import Release from './components/Release.vue'

export default {
  name: 'App',
  data: () => {
    return {
      currentReleaseId: null
    }
  },
  components: {
    Release, Index
  },
  methods: {
    showRelease: function(id) {
      this.currentReleaseId = id;
    },
    closeRelease: function() {
      this.currentReleaseId = null;
    }
  }
}
</script>
