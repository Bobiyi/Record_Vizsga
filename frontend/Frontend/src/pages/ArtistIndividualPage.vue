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
//function getArtistBanner(urlBase){
//  return "http://127.0.0.1:8000/storage/" + urlBase + "Banner.jpg"
//}
function getArtistProfilePicture(urlBase){
    return  "http://127.0.0.1:8000/storage/" + urlBase + "Icon.jpg"
}


</script>

<template>
  <q-page class="flex flex-center" v-if="store.selected != null" style="color: white;">
    <img :src="`${getArtistProfilePicture(store.selected.filePath)}`" alt="">
    <h1>{{ store.selected.artistName }}</h1>
  </q-page>
</template>


