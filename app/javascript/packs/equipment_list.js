import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

import EquipmentList from '../pages/equipment_list'


Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
    var vue = new Vue ({
        render: h => h(EquipmentList)
    }).$mount('#equipment_list')
})