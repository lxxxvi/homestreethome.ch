<template>
  <div id="#releases" class="h-screen bg-gradient-to-b from-white to-gray-200">

    <h1 class="text-6xl font-bold break-all tracking-wide bg-clip-text text-transparent bg-gradient-to-r from-blue-600 to-teal-600 uppercase leading-none mt-10 mb-5 inline-block m-auto">
          Home<br />
          Street<br />
          Home
    </h1>
    <span class="inline-block uppercase bg-clip-text text-transparent text-2xl font-bold bg-gradient-to-r from-indigo-700 to-teal-700 tracking-wide">records</span>
    <button @click="$emit('show-release-id-event', 1)">1</button>
    <button @click="$emit('show-release-id-event', 2)">2</button>
    <button @click="$emit('show-release-id-event', 3)">3</button>
    <button @click="$emit('show-release-id-event', 4)">4</button>
  </div>
</template>

<script>
export default {
}
</script>

<style scoped>
button {
  display: block;
}
</style>
