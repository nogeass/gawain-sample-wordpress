#!/bin/sh
set -e

echo "Waiting for WordPress to be ready..."
until wp core is-installed 2>/dev/null || wp db check 2>/dev/null; do
  sleep 3
done

# Install WordPress if not already installed
if ! wp core is-installed 2>/dev/null; then
  echo "Installing WordPress..."
  wp core install \
    --url="http://localhost:${WP_PORT:-8080}" \
    --title="Gawain AI Video Demo" \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@example.com \
    --skip-email

  # Set language to English (change to ja if you prefer Japanese)
  # wp language core install ja
  # wp site switch-language ja
fi

# Install and activate WooCommerce
if ! wp plugin is-installed woocommerce 2>/dev/null; then
  echo "Installing WooCommerce..."
  wp plugin install woocommerce --activate
else
  wp plugin activate woocommerce 2>/dev/null || true
fi

# Activate Gawain AI Video plugin
echo "Activating Gawain AI Video plugin..."
wp plugin activate gawain-ai-video 2>/dev/null || true

# Create a sample product for demo purposes
if [ "$(wp post list --post_type=product --format=count 2>/dev/null)" = "0" ]; then
  echo "Creating sample WooCommerce products..."

  wp wc product create \
    --name="Sample T-Shirt" \
    --type=simple \
    --regular_price=19.99 \
    --description="A sample product to demo Gawain AI Video generation." \
    --short_description="Sample product for testing." \
    --user=admin 2>/dev/null || true

  wp wc product create \
    --name="Sample Sneakers" \
    --type=simple \
    --regular_price=89.99 \
    --description="Another sample product to showcase AI video capabilities." \
    --short_description="Sample sneakers for testing." \
    --user=admin 2>/dev/null || true
fi

# Set permalink structure (required for WooCommerce and REST API)
wp rewrite structure '/%postname%/' 2>/dev/null || true
wp rewrite flush --hard 2>/dev/null || true

echo ""
echo "============================================"
echo "  Setup complete!"
echo "  Site:  http://localhost:${WP_PORT:-8080}"
echo "  Admin: http://localhost:${WP_PORT:-8080}/wp-admin"
echo "  User:  admin / admin"
echo "============================================"
