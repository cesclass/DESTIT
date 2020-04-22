<template>
  <div id="app">
    <!-- En-tête -->
    <header>
      <!-- Titre principal -->
      <h1 class="main_title">DESTIT</h1>
    </header>
    <!-- Partie princiaple -->
    <div class="main">
      <!-- Barre de recherche -->
      <nav class="searching_bar"></nav>
      <!-- Les publications -->
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
