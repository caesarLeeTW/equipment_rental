<template>
  <div>
    <Header></Header>

    <h1>[Vue] equipment rental</h1>
  </div>
</template>

<script>
import Header from "./components/header";
import axios from "axios";

export default {
  components: {
    Header,
  },
};
</script>

<style lang="scss">
body {
  background-color: #e1e2e1;
}
</style>
