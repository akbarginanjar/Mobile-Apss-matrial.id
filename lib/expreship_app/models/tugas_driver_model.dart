class TugasDriver {
  int? id;
  String? senderName;
  String? senderAddress;
  String? senderPhone;
  String? senderEmail;
  String? senderLatitude;
  String? senderLongitude;
  String? recipientName;
  String? recipientAddress;
  String? recipientPhone;
  String? recipientEmail;
  String? recipientLatitude;
  String? recipientLongitude;
  String? deliveryService;
  String? deliveryDate;
  String? deliveryEstimation;
  String? deliveryCost;
  String? specialInstructions;
  bool? insurance;
  String? promoCode;
  String? paymentMethod;
  String? trackingNumber;
  String? deliveryStatus;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Items>? items;

  TugasDriver(
      {this.id,
      this.senderName,
      this.senderAddress,
      this.senderPhone,
      this.senderEmail,
      this.senderLatitude,
      this.senderLongitude,
      this.recipientName,
      this.recipientAddress,
      this.recipientPhone,
      this.recipientEmail,
      this.recipientLatitude,
      this.recipientLongitude,
      this.deliveryService,
      this.deliveryDate,
      this.deliveryEstimation,
      this.deliveryCost,
      this.specialInstructions,
      this.insurance,
      this.promoCode,
      this.paymentMethod,
      this.trackingNumber,
      this.deliveryStatus,
      this.createdAt,
      this.updatedAt,
      this.pivot,
      this.items});

  TugasDriver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderName = json['sender_name'];
    senderAddress = json['sender_address'];
    senderPhone = json['sender_phone'];
    senderEmail = json['sender_email'];
    senderLatitude = json['sender_latitude'];
    senderLongitude = json['sender_longitude'];
    recipientName = json['recipient_name'];
    recipientAddress = json['recipient_address'];
    recipientPhone = json['recipient_phone'];
    recipientEmail = json['recipient_email'];
    recipientLatitude = json['recipient_latitude'];
    recipientLongitude = json['recipient_longitude'];
    deliveryService = json['delivery_service'];
    deliveryDate = json['delivery_date'];
    deliveryEstimation = json['delivery_estimation'];
    deliveryCost = json['delivery_cost'];
    specialInstructions = json['special_instructions'];
    insurance = json['insurance'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    trackingNumber = json['tracking_number'];
    deliveryStatus = json['delivery_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_name'] = senderName;
    data['sender_address'] = senderAddress;
    data['sender_phone'] = senderPhone;
    data['sender_email'] = senderEmail;
    data['sender_latitude'] = senderLatitude;
    data['sender_longitude'] = senderLongitude;
    data['recipient_name'] = recipientName;
    data['recipient_address'] = recipientAddress;
    data['recipient_phone'] = recipientPhone;
    data['recipient_email'] = recipientEmail;
    data['recipient_latitude'] = recipientLatitude;
    data['recipient_longitude'] = recipientLongitude;
    data['delivery_service'] = deliveryService;
    data['delivery_date'] = deliveryDate;
    data['delivery_estimation'] = deliveryEstimation;
    data['delivery_cost'] = deliveryCost;
    data['special_instructions'] = specialInstructions;
    data['insurance'] = insurance;
    data['promo_code'] = promoCode;
    data['payment_method'] = paymentMethod;
    data['tracking_number'] = trackingNumber;
    data['delivery_status'] = deliveryStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? courierTaskId;
  int? shippingOrderId;

  Pivot({this.courierTaskId, this.shippingOrderId});

  Pivot.fromJson(Map<String, dynamic> json) {
    courierTaskId = json['courier_task_id'];
    shippingOrderId = json['shipping_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courier_task_id'] = courierTaskId;
    data['shipping_order_id'] = shippingOrderId;
    return data;
  }
}

class Items {
  int? id;
  int? shippingOrderId;
  String? description;
  String? weight;
  String? dimension;
  int? quantity;
  String? value;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.shippingOrderId,
      this.description,
      this.weight,
      this.dimension,
      this.quantity,
      this.value,
      this.createdAt,
      this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingOrderId = json['shipping_order_id'];
    description = json['description'];
    weight = json['weight'];
    dimension = json['dimension'];
    quantity = json['quantity'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipping_order_id'] = shippingOrderId;
    data['description'] = description;
    data['weight'] = weight;
    data['dimension'] = dimension;
    data['quantity'] = quantity;
    data['value'] = value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
