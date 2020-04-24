<template>
    <div class="filter_box">
        <div class="box_title">
            Filters
        </div>
        <div class="box_content">
            <div class="categorie" v-for="cat in categories" :key="cat.name">
                <div class="name"> {{ cat.name }} </div>
                <div class="show_menu"> v </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data () { return {
        categories: [
            {
                name: "system", 
                values: [
                    "computer", 
                    "smartphone", 
                    "mobile phone",
                    "smartwatch"
                ]
            }, {
                name: "input device",
                values: [
                    "mouse",
                    "trackball",
                    "eyetracker"
                ]
            }, {
                name: "disability",
                values: [
                    "motor",
                    "visualy impaired"
                ]
            }, {
                name: "method",
                values: [
                    "key based",
                    "gesture based"
                ]
            }, {
                name: "navigation",
                values: [
                    "direct",
                    "switch scanning",
                    "indirect pointer"
                ]
            }, {
                name: "selection",
                values: [
                    "discrete",
                    "continuous"
                ]
            }, {
                name: "prediction system",
                values: []
            }, {
                name: "transformation",
                values: []
            }, {
                name: "output",
                values: []
            }, {
                name: "widget",
                values: []
            }
        ]
    }}
}
</script>

<style src="../css/filter.css">
</style>