import { defineStore } from "pinia";
import { api } from "src/boot/axios";
import { st } from "vue-router/dist/router-CWoNjPRp.mjs";

// INTERFÉSZEK
export interface IRecord {
  id?: number;
  name?: string;
  typeName?: string;
  releaseYear?: number;
  length?: number;
  coverUrl?: string;
}

interface IRecordState {
  records: IRecord[];
  selected: IRecord;
  original: IRecord | null;
  loading: boolean;
  error: string | null;
}

// STORE
export const useRecordStore = defineStore("records", {
  state: (): IRecordState => ({
    records: [],
    selected: null,
    original: null,
    loading: false,
    error: null,
  }),

  getters: {

  },

  actions: {



    // --- 1. Összes termék lekérése ---
    async getRecords() {
      this.loading = true;
      try {
        const res = await api.get("/records");
        this.records = res.data;
        this.error = null;
      } catch (err) {
        console.log("Hiba a termékek betöltésekor:", err);
        this.error = "Nem sikerült betölteni a termékeket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 2. Egy termék lekérése ---
    async getRecordById(id: number): Promise<void> {
      this.loading = true;
      try {
        const res = await api.get(`/records/${id}`);
        this.selected = res.data;
        this.error = null;
      } catch (err) {
        console.log("Hiba a termék lekérésekor:", err);
        this.error = "Nem sikerült betölteni a terméket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 3. Új termék létrehozása ---
    async createRecord(product: IRecord) {
      try {
        await api.post("/records", product);
        this.getProducts();
      } catch (err) {
        console.log("Hiba termék létrehozásakor:", err);
      }
    },

    
  },
});



//-----------------------------ARTISTOK--------------------------------------------------
export interface IArtist {
  id?: number;
  artistName?: string;
  activeSince?: string;
  nationality?: string;
  website?: string;
  isGroup?: boolean;
  filePath?: string;
}

interface IArtistState {
  artists: IArtist[];
  selected: IArtist;
  original: IArtist | null;
  loading: boolean;
  error: string | null;
}



export const useArtistStore = defineStore("artists", {
  state: (): IArtistState => ({
    artists: [],
    selected: null,
    original: null,
    loading: false,
    error: null,
  }),

  getters: {

  },

  actions: {



    // --- 1. Összes artist lekérése ---
    async getArtists() {
      this.loading = true;
      try {
        const res = await api.get("/artists");
        this.artists = res.data;
        this.error = null;
      } catch (err) {
        console.log("Hiba a termékek betöltésekor:", err);
        this.error = "Nem sikerült betölteni a termékeket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 2. Egy artist lekérése ---
    async getArtistById(id: number): Promise<void> {
      this.loading = true;
      try {
        const res = await api.get(`/artists/${id}`);
        this.selected = res.data;
        this.error = null;
      } catch (err) {
        console.log("Hiba a termék lekérésekor:", err);
        this.error = "Nem sikerült betölteni a terméket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 3. Új artist létrehozása ---
    async createArtist(product: IArtist) {
      try {
        await api.post("/artists", product);
        this.getArtists();
      } catch (err) {
        console.log("Hiba termék létrehozásakor:", err);
      }
    },

    
  },
});
