<template>
  <div class="text-center">
    <a @click="$emit('close-release-event')"
       class="text-gray-500 my-4 py-4 inline-block w-1/2 cursor-pointer hover:text-indigo-500 transition duration-100 ease-in-out">Back</a>
    <img :src="release.image_url"
         class="w-2/3 mx-auto my-8 shadow-2xl"
         :alt="imgAltDescription()" />

    <div class="mt-4 mb-8">
      <div class="text-gray-700">{{ release.artist }}</div>
      <div class="text-3xl tracking-wide leading-tight">{{ release.title }}</div>
      <div class="text-gray-500">{{ release.released_on }}</div>
    </div>

    <div class="mt-4 mb-8">
      <h2 class="text-sm tracking-widest text-gray-600">Tracklist</h2>
      <ul class="my-2 px-4">
        <li v-for="song in release.tracklist" :key="song">{{ song }}</li>
      </ul>
    </div>

    <div class="mt-4 mb-8" v-if="creditsExists()">
      <h2 class="text-sm tracking-widest text-gray-600">Credits</h2>
      <ul class="my-2">
        <li v-for="credit in release.credits" :key="credit">{{ credit }}</li>
      </ul>
    </div>

    <div class="mt-4 mb-8" v-if="showMore()">
      <h2 class="text-sm tracking-widest text-gray-600">More</h2>
      <ul class="my-2">
        <li v-if="discogsUrlExists()">
          <RegularLink :href="release.discogs_url">Discogs</RegularLink>
        </li>
        <li v-if="bandcampUrlExists()">
          <RegularLink :href="release.bandcamp_url">Bandcamp</RegularLink>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import RegularLink from './RegularLink'

export default {
  props: ['release'],
  components: { RegularLink },
  methods: {
    creditsExists: function() {
      return this.release.credits.length > 0;
    },
    showMore: function() {
      return this.discogsUrlExists() || this.bandcampUrlExists();
    },
    discogsUrlExists: function() {
      return this.exists(this.release.discogs_url);
    },
    bandcampUrlExists: function() {
      return this.exists(this.release.bandcamp_url);
    },
    exists: function(value) {
      return typeof(value) === "string" && value.length > 0;
    },
    imgAltDescription: function() {
      return `Cover for ${this.release.title}`
    }
  }
}
</script>

<style scoped>
img {
  max-width: 600px;
  max-height: 600px;
}
</style>
