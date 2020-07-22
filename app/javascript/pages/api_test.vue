<template>
    <div>
        <Header></Header>
        <h1>API test</h1>

        <div>
            <h3>[GET]    equipment/api/get-equipment-list</h3>
            <b-button @click="testGetEquipmemntList()">test</b-button>
            <b-button v-b-toggle.collapse-1>Result Collapse</b-button>
            <b-collapse visible id="collapse-1" class="mt-2">
                <h5>Equipment list</h5>
                <div>{{getEquipListRes ? getEquipListRes.data.value : ""}}</div>
                <b-button v-b-toggle.collapse-1-1>Detail Collapse</b-button>
                <b-collapse id="collapse-1-1" class="mt-2">
                    <h5>Status</h5>
                    <div>{{getEquipListRes ? getEquipListRes.status : ""}}</div>    
                    <h5>Header</h5>
                    <ul v-if="getEquipListRes">
                        <li v-for="(hValue, hKey) in getEquipListRes.headers"><b>{{hKey}}</b>:{{hValue}}</li>
                    </ul>
                    <h5>Full Response</h5>
                    <div>{{getEquipListRes}}</div>        
                </b-collapse>
            </b-collapse>

            
            <h3>[DELETE] equipment/api/delete-equipment</h3>
            <span class="lab">Id:</span><b-form-input size="sm" type="text" v-model="deleteId"></b-form-input><br>
            <br>
            <b-button :disabled="!deleteId" @click="testDeleteEquipment()">test</b-button>
            <b-button v-b-toggle.collapse-2>Result Collapse</b-button>
            <b-collapse visible id="collapse-2" class="mt-2">
                <h5>Result</h5>
                <div>{{deleteEquipRes}}</div>
            </b-collapse>
            
            <h3>[POST]   equipment/api/add-equipment</h3>
            <span class="lab">Name:</span><b-form-input size="sm" type="text" v-model="newName"></b-form-input><br>
            <span class="lab">Description:</span><b-form-input size="sm" type="text" v-model="newDescription"></b-form-input><br>
            <span class="lab">Images:</span><b-form-input size="sm" type="text" v-model="newImages"></b-form-input><br>
            <br>
            <b-button :disabled="!newName && !newDescription && !newImages" @click="testAddEquipment()">test</b-button>
            <b-button v-b-toggle.collapse-3>Result Collapse</b-button>
            <b-collapse visible id="collapse-3" class="mt-2">
                <h5>Result</h5>
                <div>{{addEquipRes}}</div>
            </b-collapse>
            
            <h3>[PUT]    equipment/api/update-equipment</h3>
            <span class="lab">Id:</span><b-form-input size="sm" type="text" v-model="updateId"></b-form-input><br>
            <span class="lab">Name:</span><b-form-input size="sm" type="text" v-model="updateName"></b-form-input><br>
            <span class="lab">Description:</span><b-form-input size="sm" type="text" v-model="updateDescription"></b-form-input><br>
            <span class="lab">Images:</span><b-form-input size="sm" type="text" v-model="updateImages"></b-form-input><br>
            <br>
            <b-button :disabled="!updateId && !updateName && !updateDescription && !updateImages" @click="testUpdateEquipment()">test</b-button>
            <b-button v-b-toggle.collapse-4>Result Collapse</b-button>
            <b-collapse visible id="collapse-4" class="mt-2">
                <h5>Result</h5>
                <div>{{updateEquipRes}}</div>
            </b-collapse>

            
        </div>
    </div>
</template>

<script>
import Header from './components/header'
import axios from 'axios'

export default {
    data () {
        return {
            getEquipListRes: "",
            deleteEquipRes: "",
            addEquipRes: "",
            updateEquipRes: "",

            deleteId: "",

            newName: "",
            newDescription: "",
            newImages: "",

            updateId: "",
            updateName: "",
            updateDescription: "",
            updateImages: "",
        }
    },
    methods: {
        testGetEquipmemntList() {
            this.getEquipListRes = ""
            axios({
                method: 'get',
                url: 'equipment/api/get-equipment-list'
            })
            .then( res => {
                console.log(res)
                this.getEquipListRes = res
            })
            .catch( error => {
                console.error(error)
                this.getEquipListRes = error
            })
        },
        testDeleteEquipment() {
            this.deleteEquipRes = ""
            axios({
                method: 'delete',
                url: 'equipment/api/delete-equipment/' + this.deleteId,
            })
            .then( res => {
                console.log(res)
                this.deleteEquipRes = res
            })
            .catch( error => {
                console.error(error)
                this.deleteEquipRes = error
            })
        },
        testAddEquipment() {
            this.addEquipRes = ""
            axios({
                method: 'post',
                url: 'equipment/api/add-equipment',
                data: {
                    name: this.newName,
                    description: this.newDescription,
                    images: [this.newImages],
                }
            })
            .then( res => {
                console.log(res)
                this.addEquipRes = res
            })
            .catch( error => {
                console.error(error)
                this.addEquipRes = error
            })
        },
        testUpdateEquipment() {
            this.updateEquipRes = ""
            axios({
                method: 'put',
                url: 'equipment/api/update-equipment/' + this.updateId,
                data: {
                    name: this.updateName,
                    description: this.updateDescription,
                    images: [this.updateImages],
                }
            })
            .then( res => {
                console.log(res)
                this.updateEquipRes = res
            })
            .catch( error => {
                console.error(error)
                this.updateEquipRes = error
            })
        }
    },
    components: {
        Header,
    },
    created() {
        axios.get('equipment/api/get-equipment-list')  
            .then((res)=> {
                console.log(res)
            })
            .catch((error)=> {console.error(error)})
            .finally(() => {console.log('call be finished')})
    }
}
</script>

<style lang="scss">
    body {
        background-color: #E1E2E1;
        padding: 98px 25% 0 25%;

        h3 {
            padding-top: 30px;    
        }

        .lab {
            display: inline-block;
            width: 10%;
        }
        .form-control {
            display: inline-block;
            width: 30%;
        }
    }
</style>