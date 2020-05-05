<template>
  <div class="form">
    <h5> {{ cat.name }} </h5>

    <!-- Si les valeurs sont exclusives (radio) -->
    <div class="tags_container check_type" v-if="cat.exclusive">
      <div class="tag" v-for="tag in cat.values" :key="tag">
        <input type="radio" class="radio" :name="cat.name" :value="tag">
        <label :for="tag"> {{ tag }} </label>
      </div>
    </div>

    <!-- Sinon (check) -->
    <div class="tags_container check_type" v-else>
      <div class="tag" v-for="tag in cat.values" :key="tag">
        <input type="checkbox" class="checkbox" :name="tag">
        <label :for="tag"> {{ tag }} </label>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['cat']
}
</script>

<style src="../css/form.css">
</style>