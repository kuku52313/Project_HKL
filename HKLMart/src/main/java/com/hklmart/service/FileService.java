package com.hklmart.service;

import com.hklmart.domain.ImageVO;
import com.hklmart.domain.ProductVO;
import com.hklmart.domain.RegistImageVO;
import com.hklmart.domain.StockVO;
import com.hklmart.persistence.ProductDAO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Log4j
@Service
public class FileService {

    private final ProductDAO product;

    public FileService(ProductDAO product) {
        this.product = product;
    }

    public String getFolderPath(String absolutePath) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String datePath = sdf.format(date).replace("-", File.separator);
        String path = absolutePath + "\\" + datePath;
        return path;
    }

    public void saveFile(HttpServletRequest request, ProductVO productVO, RegistImageVO imageVO, StockVO stockVO) throws IllegalStateException, IOException {
        String mainImageName = UUID.randomUUID().toString() + "_" + imageVO.getUploadImg().getOriginalFilename();
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product")));
        File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/product"));
        File image = new File(path + "\\M_" + mainImageName);
        File thumbnail = new File(path + "\\S_" + mainImageName);
        File contentImage = new File(path + "\\C_" + mainImageName);

        if (!image.exists()) {
            path.mkdirs();
            imageVO.getUploadImg().transferTo(image);
            imageVO.getContentImg().transferTo(contentImage);
            Thumbnails.of(image).size(300, 300).toFile(thumbnail);
        }

        productVO.setProductImgPath(contextPath.toString());
        productVO.setProductImg(image.toString().replace(path.toString(), ""));
        productVO.setProductThumbnail(thumbnail.toString().replace(path.toString(), ""));
        productVO.setProductContent(contentImage.toString().replace(path.toString(), ""));
        stockVO.setStockProductCode(productVO.getProductCode());
        product.saveFile(productVO);
        product.saveStock(stockVO);
    }

    public void modifyProduct(HttpServletRequest request, ProductVO productVO, RegistImageVO imageVO, StockVO stockVO) throws IllegalStateException, IOException {
        ImageVO imageInfo = product.getImageInfo(productVO.getProductCode());
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product")));
        File getImage = new File(path + imageInfo.getProductImg());
        File getThumbnail = new File(path + imageInfo.getProductThumbnail());
        File getContent = new File(path + imageInfo.getProductContent());

        String mainImageName = UUID.randomUUID().toString() + "_" + imageVO.getUploadImg().getOriginalFilename();
        File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/product"));
        File image = new File(path + "\\M_" + mainImageName);
        File thumbnail = new File(path + "\\S_" + mainImageName);
        File contentImage = new File(path + "\\C_" + mainImageName);

        if (!(imageVO.getUploadImg().getOriginalFilename().equals(""))) {
            if (getImage.exists()) {
                getImage.delete();
                getThumbnail.delete();
                getContent.delete();
            }

            if (!image.exists()) {
                imageVO.getUploadImg().transferTo(image);
                imageVO.getContentImg().transferTo(contentImage);
                Thumbnails.of(image).size(300, 300).toFile(thumbnail);
            }

            productVO.setProductImgPath(contextPath.toString());
            productVO.setProductImg(image.toString().replace(path.toString(), ""));
            productVO.setProductThumbnail(thumbnail.toString().replace(path.toString(), ""));
            productVO.setProductContent(contentImage.toString().replace(path.toString(), ""));
        } else {
            productVO.setProductImgPath(imageInfo.getProductImgPath());
            productVO.setProductImg(imageInfo.getProductImg());
            productVO.setProductThumbnail(imageInfo.getProductThumbnail());
            productVO.setProductContent(imageInfo.getProductContent());
        }
        stockVO.setStockProductCode(productVO.getProductCode());
        product.modifyFile(productVO);
        product.modifyStock(stockVO);
    }
}
