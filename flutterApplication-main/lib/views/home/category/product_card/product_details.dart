// lib/views/home/product_card/product_details.dart

import 'package:flutter/material.dart';
import 'package:gehnamall/controllers/product_details_controller.dart';
import 'package:get/get.dart';
import 'package:gehnamall/models/product_card_models.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  final ProductDetailsController controller =
      Get.put(ProductDetailsController());

  ProductDetails({Key? key, required this.product}) : super(key: key);

  void _launchUrl(String url) {
    // Placeholder for URL launching logic
    print('Launching URL: $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Image Slider
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) =>
                        controller.currentImageIndex.value = index,
                    itemCount: product.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        product.imageUrls[index],
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 200),
                      );
                    },
                  ),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(product.imageUrls.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 8),
                          width: controller.currentImageIndex.value == index
                              ? 12
                              : 8,
                          height: controller.currentImageIndex.value == index
                              ? 12
                              : 8,
                          decoration: BoxDecoration(
                            color: controller.currentImageIndex.value == index
                                ? Colors.blue
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    )),
              ],
            ),
            SizedBox(height: 16),

            // Product Name
            Center(
              child: Text(
                product.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            // Product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Karat: ${product.karat}',
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  SizedBox(height: 8),
                  Text('Weight: ${product.weight}',
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                  SizedBox(height: 8),
                  Text('Description:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // WhatsApp and Call Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchUrl('https://wa.me/+9191982031621'),
                  icon: Image.asset(
                    'assets/icons/whatsapp.png',
                    width: 24,
                    height: 24,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.chat, color: Colors.white),
                  ),
                  label: Text('WhatsApp'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () => _launchUrl('tel:+9191982031621'),
                  child: Text('Call'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Verified Badge
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow[700],
                ),
                child: Text('Verified by Bansal & Sons Jewellers Pvt Ltd',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add to wishlist functionality
              },
              child: Text('Add to Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}
