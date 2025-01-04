package com.dreamchasers.recoverbe.controller.Private;

import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.service.InvoiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RequestMapping("/api/v1/private/invoices")
@RestController
@RequiredArgsConstructor
public class InvoiceController {
    private final InvoiceService invoiceService;

    @GetMapping("")
    public ResponseEntity<ResponseObject> getInvoices(@RequestParam int page, @RequestParam int size, @RequestParam boolean isDeleted) {
        var result = invoiceService.getInvoices(page, size, isDeleted, true);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("/search")
    public ResponseEntity<ResponseObject> searchByEmail(@RequestParam String email, @RequestParam int page, @RequestParam int size, @RequestParam boolean isDeleted) {
        var result = invoiceService.searchByEmail(email, true, page, size, isDeleted);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @PutMapping("/{id}/restore")
    public ResponseEntity<ResponseObject> restoreInvoice(@PathVariable UUID id) {
        var result = invoiceService.restoreInvoice(id);
        return ResponseEntity.status(result.getStatus()).body(result);
    }


    @DeleteMapping("/delete/soft/{id}")
    public ResponseEntity<ResponseObject> softDeleteInvoice(@PathVariable UUID id) {
        var result = invoiceService.softDelete(id);
        return ResponseEntity.status(result.getStatus()).body(result);
    }
}
