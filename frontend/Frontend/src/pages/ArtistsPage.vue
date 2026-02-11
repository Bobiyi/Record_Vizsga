<script setup>
import { useArtistStore } from "../stores/store";
import { onMounted } from "vue";

const store = useArtistStore();

onMounted(() => {
  store.getArtists();
});
</script>

<template>
  <q-page class="flex flex-center">

    <div class="q-pa-md row q-gutter-md">
        <q-card class="artistCard" flat bordered v-for="artist in store.artists" :key="artist.id">

          <q-card-section>

            <router-link :to="`../artists/${artist.id}`" >   {{ artist.artistName }}</router-link>
          </q-card-section>
          </q-card>
    </div>
  </q-page>
</template>


