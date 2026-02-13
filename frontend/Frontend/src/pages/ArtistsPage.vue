<script setup>
import { useArtistStore } from "../stores/store";
import { onMounted } from "vue";

const store = useArtistStore();

onMounted(() => {
  store.getArtists();
});

function getArtistBanner(urlBase){
  return "http://127.0.0.1:8000/storage/" + urlBase + "Banner.jpg"
}
function getArtistProfilePicture(urlBase){
    return  "http://127.0.0.1:8000/storage/" + urlBase + "Icon.jpg"
}

function artistNameFormatter(name){
  if(name.length > 23){
    return name.substr(0,20)+".."
  }

  return name
}

</script>

<template>
<q-page class="flex flex-center">



  <div class="q-pa-md row q-gutter-md flex flex-center ">
  <router-link class="link"  :to="`../artists/${artist.id}`" v-for="artist in store.artists" :key="artist.id">
  
      <q-card class="card" >
          <div class="card-top"  :style="`background-image: url(${getArtistBanner(artist.filePath)}); `"></div>
          <div class="avatar-wrapper">
            <q-avatar size="100px">
              <img :src="`${getArtistProfilePicture(artist.filePath)}`">
            </q-avatar>
          </div>
  
          <q-card-section class="content-section">
            <div class="text-h6">{{artistNameFormatter(artist.artistName) }}</div>
          </q-card-section>
  
        </q-card>
  
  </router-link>
   </div>




  </q-page>
</template>

<style scoped lang="scss">
.card {
  width: 350px;
  border-radius: 12px;
  overflow: hidden;
  position: relative;
  background-color: rgb(27, 12, 12);
}

.card-top {
  height: 140px;
  background-image: url('https://picsum.photos/600/300');
  background-size: cover;
  background-position: center;
}

.avatar-wrapper {
  position: absolute;
  top: 90px;
  left: 20px;
}

.content-section {
  padding-top: 70px;
}
.link{
  text-decoration: none;
}
.text-h6{
  color: white;
}


</style>