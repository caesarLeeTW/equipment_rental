<template>
  <div>
    <Header></Header>
    <div id="body">
      <h1>Equipment list</h1>

      <ul class="equipment">
        <li v-for="(equipment, index) in equipments" :key="index">
          <h5 class="name">{{equipment.name}}</h5>
          <div class="image">
            <a href="">
              <img
                :src="equipment.images[0]"
              />
            </a>
          </div>
          <div class="description">
            {{equipment.description}}
          </div>
          <b-button @click="updateEquipment(index)">Edit</b-button>
          <b-button @click="removeEquipment(index)">Remove</b-button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import Header from "./components/header";
import axios from "axios";

export default {
  data() {
    return {
      equipments: [],
    };
  },
  components: {
    Header,
  },
  created() {
    axios
      .get("equipment/api/get-equipment-list")
      .then((res) => {
        console.log(res);
        let response = res.data
        if (response.ret == 0) {
          this.equipments = response.value
        }else {
          console.error("equipment/api/get-equipment-list error:", response.ret)
        }
      })
      .catch((error) => {
        console.error(error);
      })
      .finally(() => {
        console.log("call be finished");
      });
  },
};
</script>

<style lang="scss">
body {
  padding: 98px 25% 0 25%;

  #body {
    padding-top: 30px;

    .equipment {
      padding: 0;
      li {
        list-style-type: none;
        display: inline-block;
        width: 33.33333%;
        padding-top: 40px;
        padding-right: 10px;

        h5 {
          height: 40px;
          margin: 10px 0;
          font-size: 0.8rem;
          font-weight: 600;
        }
        .image {
          height: 220px;
          img {
            max-height: 200px;
          }
        }
        .description {
          height: 55px;
          margin-bottom: 15px;
          font-size: 0.6rem;
        }
      }
    }
  }
}
</style>
