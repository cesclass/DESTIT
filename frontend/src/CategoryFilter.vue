<template>
    <div class="filter_box">
        <h4 class="box_title">
            Filters
        </h4>
        <div class="box_content">
            <div class="category_name" v-for="cat in categories" :key="cat.name">
                <h5 class="name"> {{ cat.name }} </h5>
                <h5 class="show_menu"> v </h5>
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