const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [{ path: '', component: () => import('pages/IndexPage.vue') }],
  },
    {
    path: '/profile',
    component: () => import('layouts/MainLayout.vue'),
    children: [{ path: '', component: () => import('pages/ProfilePage.vue') }],
  },
    {
    path: '/artists',
    component: () => import('layouts/MainLayout.vue'),
    children: [{ path: '', component: () => import('pages/ArtistsPage.vue') }],
  },
  {
    path: '/records',
    component: () => import('layouts/MainLayout.vue'),
    children: [{ path: '', component: () => import('pages/AlbumsPage.vue') }],
  },
  {
    path: '/records/:id',
    component: () => import('layouts/MainLayout.vue'),
    children: [{ path: '', component: () => import('pages/AlbumIndividualPage.vue') }],
    props: true,
  },

  

  // Always leave this as last one,0
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue'),
  },
]

export default routes
