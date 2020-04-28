<template>
    <div class="filter_box">
        <h4 class="box_title">
            Filters
        </h4>
        <div class="box_content">
            <div class="category_menu" v-for="cat in categories" :key="cat.name">
                <a href="#" class="category_name" @click.prevent="open(cat.name)">
                    <h5 v-if="!cat.is_open"> {{ cat.name }} </h5>
                    <h5 class="bold" v-else> {{ cat.name }} </h5>
                    <img class="arrow" src="./assets/arrow.png" v-if="!cat.is_open">
                    <img class="arrow" src="./assets/inverted_arrow.png" v-else>
                </a>
                <div class="filters" v-if="cat.is_open">
                    <div class="filter_tag" v-for="filter in cat.values" :key="filter">
                        <h5> {{ filter }} </h5>
                    </div>
                </div>
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
                ],
                is_open: false
            }, {
                name: "input device",
                values: [
                    "mouse",
                    "trackball",
                    "eyetracker"
                ],
                is_open: false
            }, {
                name: "disability",
                values: [
                    "motor",
                    "visualy impaired"
                ],
                is_open: false
            }, {
                name: "method",
                values: [
                    "key based",
                    "gesture based"
                ],
                is_open: false
            }, {
                name: "navigation",
                values: [
                    "direct",
                    "switch scanning",
                    "indirect pointer"
                ],
                is_open: false
            }, {
                name: "selection",
                values: [
                    "discrete",
                    "continuous"
                ],
                is_open: false
            }, {
                name: "prediction system",
                values: [],
                is_open: false
            }, {
                name: "transformation",
                values: [],
                is_open: false
            }, {
                name: "output",
                values: [],
                is_open: false
            }, {
                name: "widget",
                values: [],
                is_open: false
            }
        ]
    }},

    methods: {
        open (cat_name) {
            console.log(cat_name)
            for (let i = 0; i < this.categories.length; i++) {
                let cat = this.categories[i]
                if (cat.name === cat_name) {
                    cat.is_open = !cat.is_open
                }
                this.categories.splice(i, 1, cat)
            }
        }
    }
}
</script>

<style src="../css/filter.css">
</style>