import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import UnoCSS from 'unocss/astro';
// https://vercel.com/fatners-projects/gsweats-web24-brutal/analytics?environment=all
// https://vercel.com/docs/analytics/package
import vercel from "@astrojs/vercel/serverless";


// https://astro.build/config
export default defineConfig({
  site: process.env.VERCEL_ENV === 'production' ? 'https://gsweats.ca/' : process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}/` : 'https://localhost:3000/',
  // REDIRECTS #important
  redirects: {
    '/off': '/off24',
    '/off24': '/blog/2024-06-okotoks-film-festival-2024/',
    // Shortcut to the GitHub Repo (for better "Developer Experience (DevEx)"
    // :)    #DevEx
    '/repo': 'https://github.com/GregSweats/gsweats-web24-brutal'
  },

  // Vercel Analytics
  output: "hybrid",
  adapter: vercel({
    webAnalytics: {
      enabled: true,
    },
  }),

  trailingSlash: 'ignore',
  integrations: [sitemap(), UnoCSS({
    injectReset: true
  })],
  vite: {
    optimizeDeps: {
      exclude: ['@resvg/resvg-js']
    }
  }
});