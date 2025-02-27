import { ExtraService } from "src/extra-services/entities/extra-service.entity";
import { Order } from "../entities/order.entity";

export class GetOrderWithExtraServicesDto {
    orderData: Order;
    extraServices: ExtraService[];
}