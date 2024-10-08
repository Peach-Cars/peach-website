import React from 'react';
import { createRoot } from 'react-dom/client';
import { createInertiaApp } from '@inertiajs/inertia-react';
import { InertiaProgress } from '@inertiajs/progress';
import axios from 'axios';
import Layout from '../layouts/Layout';

// Define types
import type { ComponentType } from 'react';

interface PageComponent extends ComponentType<any> {
  layout?: ComponentType<any>;
}

// Define the type for a page module
type PageModule = {
  default: PageComponent;
};

// Define the type for pages object
type Pages = Record<string, () => Promise<PageModule>>;

// Import pages dynamically
const pages = import.meta.glob('../pages/*.tsx') as Pages;

document.addEventListener('DOMContentLoaded', () => {
  const metaTag = document.querySelector('meta[name=csrf-token]');
  const csrfToken = metaTag ? metaTag.getAttribute('content') || '' : '';
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
  InertiaProgress.init({ color: '#4B55' });

  createInertiaApp({
    title: (title) => `${title} - Peach Cars`,
    resolve: async (name: string) => {
      const pageModule = pages[`../pages/${name}.tsx`];
      if (pageModule) {
        const page = (await pageModule()).default as PageComponent;
        page.layout = page.layout || Layout;
        return page;
      }
      throw new Error(`Page not found: ${name}`);
    },
    setup({ el, App, props }) {
      const root = createRoot(el);
      root.render(<App {...props} />);
    },
  });
});
