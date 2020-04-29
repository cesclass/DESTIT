<template>
    <div class="filter_box">
        <h4 class="box_title">
            Applied Filters
        </h4>
        <div class="box_content">
            <div class="box_tags">
                <span class="box_tag" v-for="tag in filter_tags" :key="tag.filter">
                    <h5> {{ tag.filter }} </h5>
                    &nbsp;
                    <a href="#" @click.prevent="delete_tag(tag)"><img class="cross" src="./assets/cross.png"></a>
                </span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['filter_tags'],

    data () {
        return {}
    },
    
    methods: {
        delete_tag (tag) {
            this.$emit('delete_tag', tag)
        }
    }
}
</script>

<style src="../css/filter.css">
</style>