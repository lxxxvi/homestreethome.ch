<template>
  <div id="#releases" class="h-screen bg-gradient-to-b from-white to-gray-200">
    <div class="mx-auto">
      <h1 class="text-6xl font-bold break-all tracking-wide bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-teal-600 uppercase leading-none mt-10 mb-5 inline-block m-auto">
            Home<br />
            Street<br />
            Home
      </h1>
      <div>
        <span class="inline-block uppercase bg-clip-text text-transparent text-2xl font-bold bg-gradient-to-r from-indigo-700 to-teal-700 tracking-wide">records</span>
      </div>

      <ul>
        <li v-for="release in releases" :key="release.id">
          <ClickableRelease v-on="$listeners" :release="release" />
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import ClickableRelease from './ClickableRelease.vue'

export default {
  props: ['releases'],
  components: { ClickableRelease }
}
</script>
