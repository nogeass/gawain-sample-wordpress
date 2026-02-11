# Gawain AI Video — WordPress/WooCommerce Plugin

AI-powered promotional video generation for WooCommerce products.

## Features

- Generate AI promotional videos from product images
- Video carousel widget on product pages (shortcode + WooCommerce hook)
- Admin dashboard to manage video generation, deployment, and deletion


## Requirements

- WordPress 5.8+
- WooCommerce 5.0+
- PHP 7.4+

## Installation

1. Download the latest release zip
2. Go to WordPress Admin > Plugins > Add New > Upload Plugin
3. Upload the zip and activate
4. Go to WooCommerce > Gawain AI to configure your API key

## Configuration

1. Get your API key from [gawain.nogeass.com](https://gawain.nogeass.com)
2. Enter the API key in WooCommerce > Gawain AI > Settings

## Usage

### Automatic (WooCommerce)
Videos are automatically displayed below the product description on WooCommerce product pages.

### Shortcode
```
[gawain_videos product_id="123"]
```

## License

This plugin is licensed under **GPLv2 or later**, in line with the WordPress.org plugin directory requirements.  
See [LICENSE](LICENSE) for the full text.

All custom PHP, JavaScript, and CSS in this repository is authored for this plugin and released under the same GPLv2-or-later terms. No third‑party libraries are bundled; the plugin runs on WordPress and WooCommerce, which are themselves GPL‑compatible.
