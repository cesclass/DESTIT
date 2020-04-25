<template>
    <nav>
        <applied-filter></applied-filter>
        <categoryFilter class="publication_filter"></categoryFilter>
    </nav>
</template>

<script>
import appliedFilter from "./AppliedFilter.vue"
import categoryFilter from "./CategoryFilter.vue"
import rangeFilter from "./RangeFilter.vue"

export default {
    components: {
        appliedFilter,
        categoryFilter,
        rangeFilter
    }
}
</script>

<style src="../css/filtreMenu.css">
</style>