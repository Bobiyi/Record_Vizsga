<template>
  <q-layout view="hHh lpR fFf">
    <q-header  class="header">
      <q-toolbar>
        <q-btn flat dense round icon="menu" aria-label="Menu" @click="toggleLeftDrawer" />

        <q-toolbar-title>
          <q-avatar>
            <img src="~/src/assets/Record_Logo.svg" alt="">
          </q-avatar>
          Record 
        </q-toolbar-title>

        
      </q-toolbar>
    </q-header>

     <q-drawer show-if-above v-model="leftDrawerOpen" side="left" class="drawer" :width="150">
        <!-- drawer content -->
        <q-scroll-area class="fit">
          <q-btn align="left" class="full-width q-ma-xs drwropt" :class="{ active: $route.path === '/' }" clickable flat
            icon="mdi-home" label="Fő oldal" no-caps to="/"/>
          <q-btn align="left" class="full-width q-ma-xs drwropt" :class="{ active: $route.path === '/profile' }" clickable flat
            icon="mdi-account" label="Profil" no-caps to="/profile" />
            <q-btn align="left" class="full-width q-ma-xs drwropt" :class="{ active: $route.path === '/artists' }" clickable flat
            icon="mdi-account-music" label="Zenészek" no-caps to="/artists" />
            <q-btn align="left" class="full-width q-ma-xs drwropt" :class="{ active: $route.path === '/albums' }" clickable flat
            icon="mdi-album" label="Kiadások" no-caps to="/albums" />
        </q-scroll-area>    
      </q-drawer>

    <q-page-container class="content">
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { ref } from 'vue'


const leftDrawerOpen = ref(true)

function toggleLeftDrawer() {
  leftDrawerOpen.value = !leftDrawerOpen.value
}
</script>

<style lang="scss">
.header{
  background-color: $darker;
  color: $deep-purple-13;
}
.content{
    background-color: $dark ;
    background: linear-gradient(0deg,
    $dark 0%,
    $dark 91%,  
    $deep-purple-13 100%);
}
.drawer{
  background-color: $darker;
  color: $deep-purple-13;
  border-right: 1px ridge $deep-purple-13 ;
  width: 200px;
}
.drwropt{
  border-top: 1px solid $deep-purple-13;
  box-shadow: 10px 0 1px 1px $deep-purple-13 inset;
}
</style>