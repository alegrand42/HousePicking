<template>
<!-- eslint-disable -->
  <v-layout>
    <v-card contextual-style="dark">
      <span slot="header">
        Houses
      </span>
      <div slot="body">
        <div id="houses">
          HOUSE LINK: <router-link to="/house">House</router-link>
          <SortedTable :values="houses">
            <thead>
              <tr>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="id">ID</SortLink>
                </th>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="name">Name</SortLink>
                </th>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="hits">Room</SortLink>
                </th>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="hits">Agency</SortLink>
                </th>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="hits">Disponibility</SortLink>
                </th>
                <th scope="col" style="text-align: left; width: 10rem;">
                  <SortLink name="hits">Size</SortLink>
                </th>
              </tr>
            </thead>
            <tbody slot="body" slot-scope="sort">
              <tr v-for="house in houses" :key="house.id">
                <td> <button class="btn btn-primary mr-1 mb-1" v-on:click="highlightHouse(house.id)">
                {{ house.id }}
                </button> </td>
                <td>{{ house.name }}</td>
                <td>{{ house.room }}</td>
                <td>{{ house.agency }}</td>
                <td>{{ house.disponibility }}</td>
                <td>{{ house.size }}</td>
              </tr>
            </tbody>
          </SortedTable>
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
import SortedTablePlugin from "vue-sorted-table";
Vue.use(SortedTablePlugin);

export default {
  name: 'HomeIndex',

  components: {
    VLayout,
    VCard,
  },
  data() {
    return {
      houses: [],
    }
  },
  created() {
    this.addHouses();
  },
  methods: {
    addHouses(){
      axios.get('http://localhost:3001/api/v1/houses').then((response) => {
        this.houses = response.data;
      }, response => {
        console.log('An Error has occured: ', response);
      });
    },
    highlightHouse(house_id) {
      console.log('House: ', house_id);
    },
  },
};
</script>
