<script setup>
import { useArtistStore } from "../stores/store";
import { onMounted } from "vue";
import { useRoute } from 'vue-router'
  const route = useRoute();
  const store = useArtistStore();
  const urlId = route.params.id

onMounted(() => {
  store.getArtistById(urlId);
});



</script>

<template>
  <q-page class="flex flex-center" v-if="store.selected != null" style="color: white;">
    <h1>{{ store.selected.artistName }}</h1>
    <hr>
    <p>{{ store.selected.nationality }}</p>
  </q-page>
</template>


