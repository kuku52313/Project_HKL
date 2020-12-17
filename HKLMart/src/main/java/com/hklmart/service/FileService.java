package com.hklmart.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hklmart.domain.ProductVO;
import com.hklmart.domain.RegistProductVO;
import com.hklmart.domain.StockVO;
import com.hklmart.persistence.ProductDAO;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class FileService {

    @Autowired
    private ProductDAO product;

    public String getFolderPath(String absolutePath) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String datePath = sdf.format(date).replace("-", File.separator);
        String path = absolutePath + "\\" + datePath;
        return path;
    }

    public void saveFile(HttpServletRequest request, RegistProductVO productDTO) throws IllegalStateException, IOException {

        String fileName = UUID.randomUUID().toString() + "_" + productDTO.getUploadImg().getOriginalFilename();
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product")));
        File image = new File(path + "\\" + fileName);
        File thumbnail = new File(path + "\\S_" + fileName);

        if (!image.exists()) {
            path.mkdirs();
            productDTO.getUploadImg().transferTo(image);
            Thumbnails.of(image).size(300, 300).outputFormat("png").toFile(thumbnail);
        }

        ProductVO productVO = new ProductVO();
        productVO.setProductCode(productDTO.getProductCode());
        productVO.setProductName(productDTO.getProductName());
        productVO.setProductBrand(productDTO.getProductBrand());
        productVO.setProductPrice(productDTO.getProductPrice());
        productVO.setProductType(productDTO.getProductType());
        productVO.setProductContent(productDTO.getProductContent());
        productVO.setProductImgPath(path.toString());
        productVO.setProductImg(image.toString().replace(path.toString(), ""));
        productVO.setProductThumbnail(thumbnail.toString().replace(path.toString(), ""));
        product.saveFile(productVO);

        StockVO stockVO = new StockVO();
        stockVO.setStockProductCode(productDTO.getProductCode());
        stockVO.setStock240(Integer.parseInt(productDTO.getStock240()));
        stockVO.setStock245(Integer.parseInt(productDTO.getStock245()));
        stockVO.setStock250(Integer.parseInt(productDTO.getStock250()));
        stockVO.setStock255(Integer.parseInt(productDTO.getStock255()));
        stockVO.setStock260(Integer.parseInt(productDTO.getStock260()));
        stockVO.setStock265(Integer.parseInt(productDTO.getStock265()));
        stockVO.setStock270(Integer.parseInt(productDTO.getStock270()));
        stockVO.setStock275(Integer.parseInt(productDTO.getStock275()));
        stockVO.setStock280(Integer.parseInt(productDTO.getStock280()));
        stockVO.setStock285(Integer.parseInt(productDTO.getStock285()));
        stockVO.setStock290(Integer.parseInt(productDTO.getStock290()));
        stockVO.setStock295(Integer.parseInt(productDTO.getStock295()));
        product.saveStock(stockVO);

    }
}
