<template>
    <nav>
        <appliedFilter class="applied_filter"></appliedFilter>
        <categoryFilter class="publication_filter"></categoryFilter>
        <rangeFilter class="time_filter"></rangeFilter>
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