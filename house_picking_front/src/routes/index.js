/* ============
 * Routes File
 * ============
 *
 * The routes and redirects are defined in this file.
 */

export default [
  // Home
  {
    path: '/home',
    name: 'home.index',
    component: () => import('@/views/Home/Index.vue'),

    meta: {
      auth: false,
    },
  },

  // House
  {
    path: '/house',
    name: 'house.index',
    component: () => import('@/views/House/Index.vue'),

    meta: {
      auth: false,
    },
  },

  {
    path: '/',
    redirect: '/home',
  },

  {
    path: '/*',
    redirect: '/home',
  },
];
