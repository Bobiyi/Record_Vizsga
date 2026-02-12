<script setup>
import { useRecordStore } from "../stores/store";
import { onMounted } from "vue";

const store = useRecordStore();

onMounted(() => {
  store.getRecords();
});



</script>

<template>
  <q-page class="flex flex-center">
    <div class="q-pa-md row q-gutter-md">
         <q-card class="recordCard" flat bordered v-for="record in store.records" :key="record.id">
               <img :src="record.coverUrl">

          <q-card-section>

            <router-link :to="`../records/${record.id}`" >   {{ record.name }}</router-link>
          </q-card-section>
          </q-card>
    </div>
  </q-page>
</template>

<style lang="scss">
.recordCard{
  width: 100%;
  max-width: 20em;
}
</style>


