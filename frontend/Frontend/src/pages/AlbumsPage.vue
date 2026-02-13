<script setup>
import { useRecordStore } from "../stores/store";
import { onMounted } from "vue";

const store = useRecordStore();

onMounted(() => {
  store.getRecords();
});

function recordNameFormatter(name){
  if(name.length > 23){
    return name.substr(0,20)+".."
  }
  return name
}
function artistNameFormat(artists){
  if(artists.length == 1){
    return artists[0]
  } 
  let string = ""
  artists = artists.reverse()
  artists.forEach(e => {
    if(string == ""){
      string = artists[0]
    }else{
      string += ", "+e
    }
  });
  return recordNameFormatter(string.trim())
}

</script>

<template>
  <q-page class="flex flex-center">


    <!--albumok container-->
    
    <div class="q-pa-md row q-gutter-md flex flex-center">
    <router-link class="router" :to="`../records/${record.id}`" v-for="record in store.records" :key="record.id">
         <q-card class="recordCard" flat bordered >
               <img :src="record.coverUrl">

          <q-card-section>
            <div class="text-h6">{{ recordNameFormatter(record.name) }}</div>
            <div>{{artistNameFormat(record.artistName) }}</div>
          </q-card-section>
          </q-card>
    </router-link>     
    </div>
    
    <!--albumok container-->



  </q-page>
</template>

<style lang="scss">
.recordCard{
  width: 100%;
  max-width: 20em;
  background-color: rgb(27, 12, 12);
  border: Groove 0.2px rgb(61, 61, 61);
  border-radius: 12px;
}
.router{
  color: white;
  text-decoration: none;
}
</style>


