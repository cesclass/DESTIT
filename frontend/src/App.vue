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
      <filtre></filtre>
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
import filtre from "./Filtre.vue"
import publication from "./Publication.vue"

export default {
  components: {
    filtre,
    publication
  },

  name: 'app'
}
</script>

<style src="../css/app.css">
</style>
