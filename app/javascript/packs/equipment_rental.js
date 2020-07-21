import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

import EquipmentRental from '../pages/equipment_rental'

Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
    var vue = new Vue ({
        render: h => h(EquipmentRental)
    }).$mount('#equipment_rental')
})