module.exports = function(eleventyConfig) {
  
    // Copy these folder to _site without converting the files in them
    eleventyConfig.addPassthroughCopy("css");
    
  };