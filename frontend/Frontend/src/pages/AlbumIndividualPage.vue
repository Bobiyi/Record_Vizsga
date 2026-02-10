<script setup>
import { Loading } from "quasar";
import { useStore } from "../stores/store";
import { onMounted } from "vue";
import { useRoute } from 'vue-router'
  const route = useRoute();
  const store = useStore();
  const urlId = route.params.id

  const startLoading = () =>{
    Loading.show()
  }

  const stopLoading = () => {
    Loading.hide()
  }
onMounted(() => {
  startLoading();
  store.getRecordById(urlId);
  stopLoading();
});



</script>

<template>
  <q-page class="flex flex-center" v-if="store.selected =! null">

    <img :src="store.selected.coverUrl" style="height: 250px;">
    <h1 style="color: wheat;">{{ store.selected.name }}</h1>

  </q-page>
</template>


