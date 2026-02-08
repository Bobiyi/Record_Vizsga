import { defineStore } from "pinia";
import { api } from "src/boot/axios";

// INTERFÉSZEK
export interface IProduct {
  id?: number;
  name?: string;
  price?: number;
  db?: number;
  akcios?: boolean;
  ertekeles?: number;
  kategoriaId?: number;
}

interface IState {
  products: IProduct[];
  selected: IProduct | null;
  cart: IProduct[];
  original: IProduct | null;
  loading: boolean;
  error: string | null;
}

// STORE
export const useStore = defineStore("products", {
  state: (): IState => ({
    products: [],
    selected: null,
    cart: [],
    original: null,
    loading: false,
    error: null,
  }),

  getters: {
    totalPrice: (state) =>
      state.cart.reduce((sum, item) => sum + (item.price || 0) * (item.db || 0), 0),
  },

  actions: {
    // --- 0. Termék hozzáadása a kosárhoz ---
    addToCart(product: IProduct) {
      const existing = this.cart.find((item) => item.id === product.id);
      if (existing) {
        existing.db = (existing.db || 0) + 1;
      } else {
        this.cart.push({ ...product, db: 1 });
      }
    },

    removeFromCart(product: IProduct) {
      const existingIndex = this.cart.findIndex((item) => item.id === product.id);
      if (existingIndex !== -1) {
        const existing = this.cart[existingIndex];
        if (existing && (existing.db || 0) > 1) {
          existing.db!--;
        } else {
          this.cart.splice(existingIndex, 1);
        }
      }
    },

    // --- 1. Összes termék lekérése ---
    async getProducts() {
      this.loading = true;
      try {
        const res = await api.get("/products");
        this.products = res.data;
        this.error = null;
      } catch (err) {
        console.log("Hiba a termékek betöltésekor:", err);
        this.error = "Nem sikerült betölteni a termékeket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 2. Egy termék lekérése ---
    async getProductById(id: number) {
      this.loading = true;
      try {
        const res = await api.get(`/products/${id}`);
        this.selected = res.data;
        this.original = { ...res.data };
        this.error = null;
      } catch (err) {
        console.log("Hiba a termék lekérésekor:", err);
        this.error = "Nem sikerült betölteni a terméket.";
      } finally {
        this.loading = false;
      }
    },

    // --- 3. Új termék létrehozása ---
    async createProduct(product: IProduct) {
      try {
        await api.post("/products", product);
        this.getProducts();
      } catch (err) {
        console.log("Hiba termék létrehozásakor:", err);
      }
    },

    // --- 4. Termék módosítása (diff) ---
    async updateProduct() {
      if (!this.selected || !this.original) return;

      const diff: Partial<IProduct> = {};
      (Object.keys(this.selected) as (keyof IProduct)[]).forEach((key) => {
        if (this.selected && this.original && this.selected[key] !== this.original[key]) {
          (diff as any)[key] = this.selected[key];
        }
      });

      if (Object.keys(diff).length === 0) {
        console.log("Nincs változás a terméken.");
        return;
      }

      try {
        await api.patch(`/products/${this.selected.id}`, diff);
        this.getProducts();
      } catch (err) {
        console.log("Hiba termék módosításakor:", err);
      }
    },

    // --- 5. Termék törlése ---
    async deleteProduct(id: number) {
      try {
        await api.delete(`/products/${id}`);
        this.getProducts();
      } catch (err) {
        console.log("Hiba termék törlésekor:", err);
      }
    },
  },
});
