<template>
  <div id="app">
    <header>
      <h1>DESTIT</h1>
    </header>
    <div class="main">
      <nav class="searching_bar"></nav>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
      <publication></publication>
    </div>
  </div>
</template>

<script>
import publication from "./Publication.vue"

export default {
  components: {
    publication
  },

  name: 'app'
}
</script>

<style src="../css/app.css">
</style>
