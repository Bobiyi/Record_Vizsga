<script setup>
import { useArtistStore, useRecordStore } from "../stores/store";
import { onMounted } from "vue";
import { useRoute } from 'vue-router'
  const route = useRoute();
  const artistStore = useArtistStore();
  const recordStore = useRecordStore();

  const urlId = route.params.id

onMounted(() => { 
  artistStore.getArtistById(urlId);
  recordStore.getRecordByArtistId(urlId);
});
function getArtistBanner(urlBase){
  return "http://127.0.0.1:8000/storage/" + urlBase + "Banner.jpg"
}
function getArtistProfilePicture(urlBase){
     return  "http://127.0.0.1:8000/storage/" + urlBase + "Icon.jpg"

}


</script>

<template>
  <q-page class="" v-if="artistStore.selected != null && recordStore.records != null" style="color: white;">

    <!--banner-->
    <q-img
    :img-style="{ objectPosition: 'top' }"
    style="height: 350px; "
    :src="`${getArtistBanner(artistStore.selected.filePath)}`"
    fit="cover"
  > 
  <div class="absolute-bottom-left q-pa-md ">
  <div class="text-white q-px-sm q-py-sm flex caption"> 
    <q-avatar size="100px">
        <img :src="`${getArtistProfilePicture(artistStore.selected.filePath)}`">
    </q-avatar>   
    <h6 style="vertical-align: middle;">{{ artistStore.selected.artistName }}</h6>
  </div>
  </div>
  </q-img>

  <!--featured albums-->
  <div class="featured-albums">
    <h4>Featured in:</h4>
    <q-virtual-scroll
      :items="recordStore.records"
      virtual-scroll-horizontal
      v-slot="{ item: record, index }"
    >
      <div
        :key="index"
        class="row items-center virtual-scroll"
      >
      <!--album card-->
        <q-card class="recordCard" flat bordered>
                 <img :src="record.coverUrl">
            <q-card-section>
              <router-link :to="`../records/${record.id}`" >   {{ record.name }}</router-link>
            </q-card-section>
            </q-card>
    
 
    <!--album card END-->
    </div>
  </q-virtual-scroll>

   </div>
  <!--featured albums END-->

  </q-page>
</template>


<style lang="scss" scoped>
.featured-albums{
  background-color: rgb(37, 30, 30);
  padding-left: 3em;
  padding-bottom: 2em;
margin-top: 1em;
}
.recordCard{
  height: 24em;
  width: 20em;
  margin-right: 2em;

}

.absolute-bottom-left{
  border-radius: 20px;
  margin: 10px;
  padding: 0;
}
h6{
  padding: 0px;
  padding-left: 10px;
  margin: auto;
}
.caption{
  height: 120px; 
}

</style>