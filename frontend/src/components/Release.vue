<template>
  <div>
    <a @click="$emit('close-release-event')">close</a>
    <h1>Release</h1>
    {{ releaseId }}
  </div>
</template>

<script>
export default {
  props: ['releaseId']
}
</script>
