import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

import EquipmentAdd from '../pages/equipment_add'

Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
    var vue = new Vue ({
        render: h => h(EquipmentAdd)
    }).$mount('#equipment_add')
})