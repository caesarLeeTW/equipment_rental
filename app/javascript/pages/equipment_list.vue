<template>
    <div>
        <Header></Header>
        <h1>[Vue] equipment list</h1>
    </div>
</template>

<script>
import Header from './components/header'
import axios from 'axios'

export default {
    components: {
        Header,
    },
    created() {
        axios.get('equipment/api/get-equipment-list')  
            .then((res)=> {console.log(res)})
            .catch((error)=> {console.error(error)})
            .finally(() => {console.log('call be finished')})
    }
}
</script>

<style>
    body {
        background-color: #E1E2E1;
        padding: 98px 25% 0 25%;
        
    }
</style>