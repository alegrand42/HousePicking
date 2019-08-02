<template>
<!-- eslint-disable -->
  <v-layout>
    <v-card contextual-style="dark">
      <span slot="header">
        House
      </span>
      <div slot="body">
        <div v-if="houses.length > 0">
          <v-select-search v-model='selectedHouseId' :items='houses' :shows='"name"'></v-select-search>
            <div class="new-fetch">
              <p>Scene Id Selected: {{ selectedHouseId }}.
              <button class="btn btn-primary mr-1 mb-1" v-on:click="highlightHouse(selectedHouseId)">
                Show House
              </button> </p>
        </div>
      </div>
        <div id="house">
          <h3> {{ house.name }} </h3>
          <ul>
            <li><font size=4 color="blue">ID:</font> {{house.id}}</li>
            <li><font size=4 color="blue">NAME:</font> {{ house.name }}</li>
            <li><font size=4 color="blue">ROOM:</font> {{ house.room }}</li>
            <li><font size=4 color="blue">SIZE:</font> {{ house.size }}</li>
            <li><font size=4 color="blue">AGENCY:</font> {{ house.agency }}</li>
            <li><font size=4 color="blue">DISPONIBILITY:</font> {{ house.disponibility }}</li>
          </ul>
      </div>
      </div>
    </v-card>
  </v-layout>
</template>

<script>

/* eslint-disable */

import Vue from 'vue';
import VLayout from '@/layouts/Default.vue';
import VCard from '@/components/Card.vue';
import axios from 'axios';
import VSelectSearch from '@/components/search/select-search.vue';
import SortedTablePlugin from "vue-sorted-table";
Vue.use(SortedTablePlugin);

export default {
  name: 'HouseIndex',

  components: {
    VLayout,
    VSelectSearch,
    VCard,
  },
  data() {
    return {
      houses: [],
      house: [],
      selectedHouseId: 1,
    }
  },
  created() {
    this.addHouses();
    this.getHouse(this.selectedHouseId);
  },
  methods: {
    addHouses(){
      axios.get('http://localhost:3001/api/v1/houses').then((response) => {
        this.houses = response.data;
      }, response => {
        console.log('An Error has occured: ', response);
      });
    },
    highlightHouse(selectedHouseId) {
      if (selectedHouseId > 0) {
        this.getHouse(selectedHouseId);
      }
    },
    getHouse(houseId) {
      let url = 'http://localhost:3001/api/v1/houses/';
      url += houseId;
      axios.get(url).then((response) => {
        this.house = response.data;
      },
      response => {
        console.log('An Error has occured: ', response);
      }
      );
    },
  },
};
</script>
