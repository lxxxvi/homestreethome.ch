<template>
  <div id="#releases">
    <ul>
      <li v-for="release in releases" :key="release.id">
        <ClickableRelease v-on="$listeners" :release="release" />
      </li>
    </ul>
  </div>
</template>

<script>
import ClickableRelease from './ClickableRelease.vue'

export default {
  props: ['releases', 'yPosition'],
  components: { ClickableRelease },
  mounted: function() {
    window.scrollTo(0, this.yPosition);
  }
}
</script>
