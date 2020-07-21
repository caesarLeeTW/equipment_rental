import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

import ApiTest from '../pages/api_test'


Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
    var vue = new Vue ({
        render: h => h(ApiTest)
    }).$mount('#api_test')
})