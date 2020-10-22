<template>
  <div>
    <Header></Header>
    <div id="body">
      <h1>Equipment list</h1>

      <div class="equipments">
        <div class="equipment" v-for="(equipment, index) in equipments" :key="index">
          <h5 class="name"><a :href="'rental?id=' + equipment.id">{{equipment.name}}</a></h5>
          <div class="image">
            <a :href="'rental?id=' + equipment.id">
              <img
                :src="equipment.images[0]"
              />
            </a>
          </div>
          <div class="description">
            {{equipment.description}}
          </div>
          <div class="button">
            <a :href="'rental?id=' + equipment.id">
              <div>Book now</div>
            </a>
          </div>
        </div>
      </div>
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

    .equipments {
      display: flex;
      width: 100%;
      flex-wrap: wrap;
      .equipment {
        // display: inline-flex;
        width: 33.33333%;
        padding-top: 40px;
        padding-right: 10px;

        h5 {
          height: 40px;
          margin: 10px 0;
          font-size: 0.8rem;
          font-weight: 600;
          a {
            // text-decoration: none;
            color: black;
          }
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
        .button {
          a {
            display: inline-block;
            background-color: #e8f5e9;
            color: #b6c2b7;
            text-decoration: none;
            border-radius: 4px;
            border: 1px solid transparent;
            &:hover {
              background-color: #b6c2b7;
              border-color: #dbdbdb;
              color: #e8f5e9;
            }
            div {
              padding: 10px 15px;
            }
          }
        }
      }
    }
  }
}
</style>
