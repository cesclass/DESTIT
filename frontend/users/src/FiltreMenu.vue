<template>
    <nav>
        <applied-filter 
            :filter_tags="filter_tags"
            v-if="filter_tags.length > 0"
            @delete_tag="delete_filter($event)">
        </applied-filter>
        <categoryFilter class="publication_filter"
            @selected="apply_filter($event)">
        </categoryFilter>
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
    },

    data () {
        return {
            filter_tags: []
        }
    },

    methods: {
        apply_filter (tag) {
            let exist = false
            for (let i = 0; i < this.filter_tags.length; i ++) {
                exist = exist || (tag.filter === this.filter_tags[i].filter)
            }
            if (!exist) {
                this.filter_tags.push(tag)
            }
        },
        delete_filter (tag) {
            for (let i = 0; i < this.filter_tags.length; i ++) {
                if (tag.filter === this.filter_tags[i].filter) {
                    this.filter_tags.splice(i, 1)
                }
            }
        }
    }
}
</script>

<style src="../css/filtreMenu.css">
</style>