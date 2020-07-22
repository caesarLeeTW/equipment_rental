<template>
  <div>
    <Header></Header>

    <div id="body">
      <h1>Add equipment</h1>
      <b-button class="add-button" @click="promtAddEquipment">Add</b-button>

      <ul class="equipment">
        <li v-for="(equipment, index) in equipments" :key="index">
          <h5 class="name">{{ equipment.name }}</h5>
          <div class="image" @click="promptEditEquipment(equipment)">
            <a>
              <img :src="equipment.images[0]" />
            </a>
          </div>
          <div class="description">
            {{ equipment.description }}
          </div>
          <b-button @click="promptEditEquipment(equipment)">Edit</b-button>
          <b-button @click="promptRemoveEquipment(equipment)">Remove</b-button>
        </li>
      </ul>
    </div>

    <b-modal
      centered
      id="equipment-edit"
      :title="modalTitle"
      @hidden="resetModal"
      @ok="modalConfirmed"
    >
      <b-form>
        <b-form-group label="Name" invalid-feedback="name is required">
          <b-form-input
            :readonly="remove"
            v-model="name"
            required
          ></b-form-input>
        </b-form-group>
        <b-form-group
          label="Description"
          invalid-feedback="Description is required"
        >
          <b-form-textarea
            rows="2"
            max-rows="5"
            :readonly="remove"
            v-model="description"
            required
          ></b-form-textarea>
        </b-form-group>
        <b-form-group label="Image" invalid-feedback="Image is required">
          <b-form-input
            :readonly="remove"
            v-model="image"
            required
          ></b-form-input>
        </b-form-group>
      </b-form>
    </b-modal>
  </div>
</template>

<script>
import Header from "./components/header";
import axios from "axios";

export default {
  data() {
    return {
      equipments: [],

      selectedId: -1,
      name: "",
      description: "",
      image: "",

      modalTitle: "",
      remove: false,
    };
  },
  components: {
    Header,
  },
  methods: {
    resetModal() {
      this.selectedId = -1;
      this.name = "";
      this.description = "";
      this.image = "";
    },
    promtAddEquipment() {
      this.resetModal();
      this.modalTitle = "Add equipment";
      this.remove = false;
      this.$bvModal.show("equipment-edit");
    },
    promptEditEquipment(equipment) {
      this.selectedId = equipment.id;
      this.name = equipment.name;
      this.description = equipment.description;
      this.image = equipment.images[0];
      this.modalTitle = "Edit equipment";
      this.remove = false;
      this.$bvModal.show("equipment-edit");
    },
    promptRemoveEquipment(equipment) {
      this.selectedId = equipment.id;
      this.name = equipment.name;
      this.description = equipment.description;
      this.image = equipment.images[0];
      this.modalTitle = "Remove equipment";
      this.remove = true;
      this.$bvModal.show("equipment-edit");
    },
    modalConfirmed() {
      let self = this;
      var promise = null;
      if (this.modalTitle === "Add equipment") {
        promise = this.addEquipment({
          name: this.name,
          description: this.description,
          images: [this.image],
        });
      } else if (this.modalTitle === "Edit equipment") {
        promise = this.updateEquipment({
          name: this.name,
          description: this.description,
          images: [this.image],
        });
      } else {
        promise = this.removeEquipment(this.selectedId);
      }
      promise
        .then((res) => {
          console.log(res);
          if (res.data.ret == 0) {
            console.log(self.modalTitle + " successfully");
            self.getEquipment();
          } else {
            console.error("Update equipment failed", res.data.ret);
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    addEquipment(data) {
      return axios({
        method: "post",
        url: "equipment/api/add-equipment",
        data: data,
      });
    },
    removeEquipment(index) {
      return axios({
        method: "delete",
        url: "equipment/api/delete-equipment/" + index,
      });
    },
    updateEquipment(data) {
      return axios({
        method: "put",
        url: "equipment/api/update-equipment/" + this.selectedId,
        data: data,
      });
    },
    getEquipment() {
      return axios({
        method: "get",
        url: "equipment/api/get-equipment-list",
      })
        .then((res) => {
          console.log(res);
          let response = res.data;
          if (response.ret == 0) {
            this.equipments = response.value;
          } else {
            console.error(
              "equipment/api/get-equipment-list error:",
              response.ret
            );
          }
        })
        .catch((error) => {
          console.error(error);
        })
        .finally(() => {
          console.log("call be finished");
        });
    },
  },
  created() {
    this.getEquipment();
  },
};
</script>

<style lang="scss">
body {
  padding: 98px 25% 0 25%;
  h1 {
    display: inline-block;
  }
  #body {
    padding-top: 30px;

    .add-button {
      vertical-align: super;
      cursor: pointer;
    }
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
          cursor: pointer;
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
