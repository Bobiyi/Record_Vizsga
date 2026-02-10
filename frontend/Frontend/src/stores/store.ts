import { defineStore } from "pinia";
import { api } from "src/boot/axios";

// INTERFÉSZEK
export interface IProduct {
  id?: number;
  name?: string;
  typeName?: string;
  releaseYear?: number;
  length?: number;
  coverUrl?: string;
}

interface IState {
  products: IProduct[];
  selected: IProduct;
  cart: IProduct[];
  original: IProduct | null;
  loading: boolean;
  error: string | null;
}

// STORE
export const useStore = defineStore("records", {
  state: (): IState => ({
    products: [],
    selected: null,
    cart: [],
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
    async createRecord(product: IProduct) {
      try {
        await api.post("/records", product);
        this.getProducts();
      } catch (err) {
        console.log("Hiba termék létrehozásakor:", err);
      }
    },

    
  },
});
